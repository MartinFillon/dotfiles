{ pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading = true;
      };

      # Background - This replicates --screenshots and --effect-blur
      background = [
        {
          monitor = "";
          path = "screenshot"; # This takes a screenshot of your desktop
          blur_passes = 3; # Higher = more blur
          blur_size = 7;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      # Input Field - This replicates --indicator and --ring-color
      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgb(bb00cc)"; # Your ring color
          inner_color = "rgb(200, 200, 200)";
          font_color = "rgb(10, 10, 10)";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      # Clock - This replicates --clock
      label = [
        {
          monitor = "";
          text = "$TIME"; # Built-in variable for time
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 64;
          font_family = "Noto Sans";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
