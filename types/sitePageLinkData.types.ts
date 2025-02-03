export type LinkType = {
      title: string;
      href: string;
      description: string;
      active: boolean;
    }
export interface SitePageLinkData {
  navigation: {
    tarot: LinkType[];
  };
  serviceCards: any[];
}
