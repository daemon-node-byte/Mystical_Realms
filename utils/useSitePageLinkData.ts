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
      ],
    },
    serviceCards: [],
  };
}
