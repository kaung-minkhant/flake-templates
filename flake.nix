{
  description = "Flake templates collections";

  outputs = { self }: {
    templates = {
      basic = {
        path = ./basic;
        description = "A very basic flake";
      };
    };
  };
}
