require 'open3'

class DockerManager
    
    def get_environments
        command = "docker ps --all"
        stdout, stderr, status = Open3.capture3(command)
        
        match_envs = stdout.scan(/wpd_web_(.+_\d+)/)
        match_web = stdout.scan(/.*0\.0\.0\.0:(\d+)->80\/tcp.*wpd_web_(.+_\d+)/)
        match_db = stdout.scan(/.*0\.0\.0\.0:(\d+)->3306\/tcp.*wpd_db_(.+_\d+)/)
        
        match = Array.new
        match_envs.each do |env|

            web_port_match = match_web.select { |item| item[1] == env[0] }
            db_port_match = match_db.select { |item| item[1] == env[0] }

            web_port = "<stopped>"
            if web_port_match.count != 0
                web_port = web_port_match[0][0]
            end

            db_port = "<stopped>"
            if db_port_match.count != 0
                db_port = db_port_match[0][0]
            end
            match.push({"env" => env[0], "web_port" => web_port, "db_port" => db_port})
        end
        
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