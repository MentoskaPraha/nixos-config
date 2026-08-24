{ ... }: {
  programs.plasma.inputs.touchpads = [
    {
      name = "PIXA3854:00 093A:0274 Touchpad";
      productId = "0274";
      vendorId = "093a";
      enable = true;
      disableWhileTyping = false;
      leftHanded = false;
      middleButtonEmulation = false;
      rightClickMethod = "twoFingers";
      pointerSpeed = 0;
      acelerationProfile = "default";
      naturalScroll = true;
      scrollMethod = "twoFingers";
      scrollSpeed = 0.3;
      tapAndDrag = false;
      tapDragLock = false;
      tapToClick = false;
      twoFingerTap = false;
    }
  ];
}
