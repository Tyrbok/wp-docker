require 'open3'

class DockerManager

    def get_environments
        command = "docker ps --all"
        stdout, stderr, status = Open3.capture3(command)

        match = stdout.scan(/wpd_web_(.+_\d+)/).map { |item| item[0] }
        return match
    end 

    def get_new_wpd_id
        command = "docker ps --all"
        stdout, stderr, status = Open3.capture3(command)

        match = stdout.scan(/wpd_.+_(\d+)/)
        current_ids = match.uniq

        if current_ids.count > 89
            puts "No more available ids"
            exit
        end

        new_id = nil
        while new_id == nil
            rand_id = rand(10..99)
            if !match.include? rand_id
                new_id = rand_id
            end
        end

        return new_id
    end

    def start environment
        web = "wpd_web_" + environment
        db = "wpd_db_" + environment

        puts "Start: " + db
        command="docker start " + db
        system(command)

        puts "Start: " + web
        command="docker start " + web
        system(command)        
    end

    def stop environment
        web = "wpd_web_" + environment
        db = "wpd_db_" + environment

        puts "Stop: " + web
        command="docker stop " + web
        system(command)
        
        puts "Stop: " + db
        command="docker stop " + db
        system(command)
    end

    def remove environment

        self.stop environment

        web = "wpd_web_" + environment
        db = "wpd_db_" + environment

        puts "Remove: " + web
        command="docker rm " + web
        system(command)

        puts "Remove: " + db
        command="docker rm " + db
        system(command)
    end
end