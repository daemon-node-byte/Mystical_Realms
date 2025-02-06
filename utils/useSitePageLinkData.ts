export default function useSitePageLinkData() {
  return {
    navigation: {
      tarot: [
        {
          title: "Cards catalog",
          href: "/tarot/cards",
          description:
            "Explore the catalog of the 78 cards in tarot deck. Study the art, meanings, and symbolism of each card.",
          active: true,
          icon: "mr-icons:cards"
        },
        {
          title: "Spread editor",
          href: "/tarot/spread/editor",
          description:
            "Create and customize your own tarot spreads. Save and share them with others. Use them in your online readings.",
          active: true,
          icon: "mr-icons:placemat"
        },
        {
          title: "Online readings",
          href: "/tarot/spread/editor",
          description:
            "Create and customize your own tarot spreads. Save and share them with others. Use them in your online readings.",
          active: true,
          icon: "mr-icons:readings"
        }
      ],
    },
    serviceCards: [],
  };
}
