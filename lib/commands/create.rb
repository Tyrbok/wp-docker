def wp_docker_create
    check_docker_exist
    docker_manager = DockerManager.new
    id = docker_manager.get_new_wpd_id

    puts "New Instance Id: #{id}"

    name = get_proyect_name
    table_prefix = get_table_prefix name

    web_port = 18000 + id
    db_port = 13300 + id

    if !auto_ports? web_port, db_port
        web_port = get_port DEFAULT_WEB_PORT, "Enter Web Port"
        db_port = get_port DEFAULT_DB_PORT, "Enter Database Port"
    end

    create_file id, name, table_prefix, web_port, db_port
    dockerfile_wp = File.join(File.dirname(File.realpath(__FILE__)), '../../templates/Dockerfile-wp')
    FileUtils.copy dockerfile_wp, "./"

    Dir.mkdir './src'
    gitignore = File.join(File.dirname(File.realpath(__FILE__)), '../../templates/gitignore.tpl')
    FileUtils.copy gitignore, "./src/.gitignore"


    start_docker = ""
    while start_docker != "y" && start_docker != "n"
        start_docker = ask "Start? (y/n)"
    end

    if start_docker == "y"
        docker_start web_port
    end
end

def auto_ports? default_web_port, default_db_port
    puts "Auto-assigned ports"
    puts "Web: #{default_web_port}"    
    puts "Database: #{default_db_port}"
    puts

    response = ""
    while response != "y" && response != "n"
        response = ask "Use auto-assigned ports? (y/n)"
    end

    return response == "y"
end

def get_proyect_name 
    default = Dir.pwd.split('/').last.tr('^A-Za-z0-9', '').downcase
    name = ask "Enter container name (#{default}): "
    error_message = 'Invalid name. Only letters and numbers. Must start with letter'

    if name == ""
        return default
    end

    if !name.match(/^[[:alpha:]][[:alnum:]]+$/)
        puts error_message
        exit
    end
    return name
end

def get_table_prefix name
    prefix = ask "Enter mysql table prefix ('#{name}' for 'wp_#{name}_'): "
    if prefix == ""
        return name
    end
    error_message = 'Invalid name. Only letters and numbers. Must start with letter'
    if !name.match(/^[[:alpha:]][[:alnum:]]+$/)
        puts error_message
        exit
    end
    return prefix
end

def get_port default_port, message
    port = ask "#{message} (#{default_port}): "
    if port == ""
        return "#{default_port}"
    end

    i_port = port.to_i
    if i_port < 8000
        puts "Error: port must be a number higher than 8000: Actually #{port}"
        exit
    end

    if i_port > 65535
        puts "Error: port must be a number lower than 65535: Actually #{port}"
        exit
    end

    return port
end

def check_docker_exist
    if File.file?("docker-compose.yml")
        puts "Error: docker-compose.yml exists"
        exit
    end
end


def create_file id, name, table_prefix, web_port, db_port
    template = File.join(File.dirname(File.realpath(__FILE__)), '../../templates/docker-compose.yml.tpl')

    file = File.open(template, "r")
    data = file.read
    file.close

    data = data.gsub! '{id}', id.to_s
    data = data.gsub! '{name}', name
    data = data.gsub! '{web_port}', web_port.to_s
    data = data.gsub! '{db_port}', db_port.to_s
    data = data.gsub! '{table_prefix}', table_prefix

    out_file = File.new("docker-compose.yml", "w")
    out_file.puts(data)
    out_file.close

    # puts data    
end