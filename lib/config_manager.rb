class ConfigManager 
    def get_wp_container_name
        file_lines = get_file_lines

        container_line = file_lines.grep(/container_name: wpd_web/)
        name = container_line[0].scan(/wpd_.+_\d+/)[0]
        return name    
    end

    def get_wp_environment_name
        file_lines = get_file_lines

        container_line = file_lines.grep(/container_name: wpd_web/)
        name = container_line[0].scan(/(wpd_[a-z]+)_(.+\d+)/)
        return name[0][1]
    end

    def get_wp_container_port
        file_lines = get_file_lines

        container_line = file_lines.grep(/:80"/)
        ret = container_line[0].scan(/(\d+):(\d+)"/)
        return ret[0][0]
    end

    def is_docker_compose_directory

    end

    def get_file_lines
        unless self.is_docker_compose_folder
            puts "docker-compose.yml does not exists in current directory. Choose one of the available environments."
            puts
            wp_docker_list
            exit
        end

        file_lines = File.readlines("docker-compose.yml")
        unless file_lines.grep(/## wp-docker ##/).any?
            puts "Invalid docker-compose.yml"
            exit
        end

        file_lines
    end

    def is_docker_compose_folder
        File.file?("docker-compose.yml")
    end
end