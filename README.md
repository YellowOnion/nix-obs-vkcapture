put this in your `configuration.nix`:

```nix
let
  vkc = import (
    builtins.fetchTarball {
        url ="https://github.com/YellowOnion/nix-obs-vkcapture/archive/refs/heads/master.tar.gz" 
        ;}
    )  { pkgs = pkgs; };
in
{ 
    # ...
    environment.systemPackages = with pkgs; [
    #...  
    vkc.obs-vkcapture
    vkc.obs-vkcapture-lib32
    (wrapOBS { plugins = [ vkc.obs-vkcapture ]; } )
    #...
    ];
    #...
}
```
