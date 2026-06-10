{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 50;
        modules-left = [
          "clock"
          "hyprland/workspaces"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "network"
          "bluetooth"
          "temperature"
          "battery"
          "tray"
        ];
        "hyprland/window" = {
          format = "{}";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };

        "clock" = {
          format = " {:%I:%M %p   %a; %b %e}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          timezone = "Europe/Paris";
        };

        "network" = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "{ipaddr}/{cidr}";
          tooltip-format = "{essid} - {ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}={essid} {ipaddr}/{cidr}";
        };

        "bluetooth" = {
          format = " {status}";
          format-disabled = ""; # an empty format will hide the module
          format-connected = " {num_connections}";
          tooltip-format = "{device_alias}";
          tooltip-format-connected = " {device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
        };

        "temperature" = {
          thermal-zone = 1;
          format = "{temperatureC}°C ";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C ";
        };
      };
    };
    style = ''
            * {
          border: none;
          border-radius: 0;
          font-family: "JetBrainsMono Nerd Font";
          font-weight: bold;
          font-size: 16px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(21, 18, 27, 0);
          color: #cdd6f4;
      }

      tooltip {
          background: #1e1e2e;
          border-radius: 10px;
          border-width: 2px;
          border-style: solid;
          border-color: #11111b;
      }

      #workspaces button {
          padding: 5px;
          color: #313244;
          margin-right: 5px;
      }

      #workspaces button.active {
          color: #a6adc8;
      }

      #workspaces button.focused {
          color: #a6adc8;
          background: #eba0ac;
          border-radius: 10px;
      }

      #workspaces button.urgent {
          color: #11111b;
          background: #a6e3a1;
          border-radius: 10px;
      }

      #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
          border-radius: 10px;
      }

      #custom-power_profile,
      #custom-weather,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #temperature,
      #workspaces,
      #tray,
      #backlight {
          background: #1e1e2e;
          opacity: 0.8;
          padding: 0px 10px;
          margin: 3px 0px;
          margin-top: 10px;
          border: 1px solid #181825;
      }

      #temperature {
          border-radius: 10px 0px 0px 10px;
      }

      #temperature.critical {
          color: #eba0ac;
      }

      #backlight {
          border-radius: 10px 0px 0px 10px;
      }

      #tray {
          border-radius: 10px;
          margin-right: 10px;
      }

      #workspaces {
          background: #1e1e2e;
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;
      }

      #custom-power_profile {
          color: #a6e3a1;
          border-left: 0px;
          border-right: 0px;
      }

      #window {
          color: #cba6f7;
          border-radius: 10px;
          margin-left: 60px;
          margin-right: 60px;
      }

      #clock {
          color: #fab387;
          border-radius: 10px;
          margin-left: 10px;
          border-right: 0px;
      }

      #network {
          color: #f9e2af;
          border-radius: 10px 0px 0px 10px;
          border-left: 0px;
          border-right: 0px;
      }

      #bluetooth {
          color: #89b4fa;
          border-radius: 0px 10px 10px 0px;
          margin-right: 10px
      }

      #pulseaudio {
          color: #89b4fa;
          border-left: 0px;
          border-right: 0px;
      }

      #pulseaudio.microphone {
          color: #cba6f7;
          border-left: 0px;
          border-right: 0px;
          border-radius: 0px 10px 10px 0px;
          margin-right: 10px;
      }

      #battery {
          color: #a6e3a1;
          border-radius: 0 10px 10px 0;
          margin-right: 10px;
          border-left: 0px;
      }
    '';
  };
}
