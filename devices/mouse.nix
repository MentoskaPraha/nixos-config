{ ... }: {
  programs.plasma.input.mice = [
    {
      name = "Logitech Gaming Mouse G600";
      productId = "c24a";
      vendorId = "046d";
      enable = true;
      acceleration = 0;
      accelerationProfile = "none";
      leftHanded = false;
      middleButtonEmulation = false;
      naturalScroll = false;
      scrollSpeed = 1;
    }
  ];
}
