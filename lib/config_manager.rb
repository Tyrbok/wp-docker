class ConfigManager 
    def get_wp_container_name
        file_lines = get_file_lines

        container_line = file_lines.grep(/container_name: wpd_web/)
        name = container_line[0].scan(/wpd_.+_\d+/)[0]
        return name    
    end

    def get_wp_container_port
        file_lines = get_file_lines

        container_line = file_lines.grep(/:80"/)
        ret = container_line[0].scan(/(\d+):(\d+)"/)
        return ret[0][0]
    end

    def get_file_lines
        if !File.file?("docker-compose.yml")
            puts "docker-compose.yml does not exists"
            exit
        end

        file_lines = File.readlines("docker-compose.yml")
        if !file_lines.grep(/## wp-docker ##/).any?
            puts "Invalid docker-compose.yml"
            exit
        end

        return file_lines
    end 
end