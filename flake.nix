{
  description = "Flake templates collections";

  outputs = { self }: {
    templates = {
      basic = {
        path = ./basic;
        description = "A very basic flake";
      };
      go = {
        path = ./go;
        description = "A simple go template flake";
      };
      typescript-npm = {
        path = ./typescript/npm;
        description = "Template with node server and dev environment with typescript";
      };
    };
  };
}
