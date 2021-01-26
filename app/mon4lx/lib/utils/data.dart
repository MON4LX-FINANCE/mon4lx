class OnboardingPage {
  String imageUrl;
  String title;
  String description;

  OnboardingPage(this.imageUrl, this.title, this.description);
}

List<OnboardingPage> getOnboardingPages() {
  return <OnboardingPage>[
    OnboardingPage("assets/images/onboarding_1.png", "Quick and easy.",
        "Millions of customers around the world use us for one simple reason: it's simple. Just an phone number and pin we open up a door of new financial possibilities to you and your business. It's more than a wallet"),
    OnboardingPage("assets/images/onboarding_2.png", "We've got you covered.",
        "Accept payments, transfer to family and friends and withdraw your funds with peace of mind, knowing that world class encryption and real time security features are baked right in. A wallet You can Trust"),
    OnboardingPage("assets/images/onboarding_3.png", "Shop around the world.",
        "With Mon4LX, you get access to millions of products anywhere in the world. With our prepaid debit cards, you can use any of the 100+million VISA accepting terminals around the world, These Include ATM's, POS Machines etc"),
  ];
}
