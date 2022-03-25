job "http-echo-static" {
    datacenters = ["dc1"]

    namespace = "default"

    type = "service"

    group "echo" {
    network {
                    mbits = 10
                    port "http" {
                        static = 8082
                    }
                }
        count = 2
        task "server" {
            driver = "docker"

            config {
                image = "hashicorp/http-echo:latest"
                args = [
                    "--listen", ":8082",
                    "--text", "Hello and welcome to 127.0.0.1 running on port 8082"
                ]
            }

            resources {
                
            }
        }
    }
}
