{ pkgs, ... }:
{
  # If you use a firewall you will need to enable these ports
  # networking = {
  #   firewall.allowedTCPPorts = config.networking.firewall.allowedTCPPorts ++ [
  #     3000  # mercury-web-backend
  #     9090  # prometheus
  #     1010  # grafana
  #   ];
  #   useDHCP = true;
  # };
  services = {
    prometheus = {
      enable = true;
      scrapeConfigs = [
        {
          job_name = "prometheus";
          static_configs = [ { targets = ["localhost:9090"]; } ];
        }
        {
          job_name = "mercury-web-backend";
          static_configs = [ { targets = ["localhost:3000"]; } ];
        }
      ];
    };
    grafana = {
      enable = true;
      domain = "grafana.mwb";
      port = 1010;
      addr = "127.0.0.1";
    };
  };
}

