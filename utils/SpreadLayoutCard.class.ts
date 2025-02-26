class SpreadLayoutCard {
  public card: HTMLDivElement;
  public position: { x: number, y: number } = { x: 0, y: 0 };
  public size: { width: number, height: number } = { width: 0, height: 0 };
  public boundsDimensions: { width: number, height: number } = { width: 0, height: 0 };
  constructor() {
    this.card = document.createElement('div');
    this.card.className = 'target';
  }
  public setCardPosition(x: number, y: number) {
    this.position = { x, y };
    this.card.style.transform = `translate(${x}px, ${y}px)`;
  }
  public setSize(width: number, height: number) {
    this.size = { width, height };
    this.card.style.width = `${width}px`;
    this.card.style.height = `${height}px`;
  }
  public setBoundsDimensions(width: number, height: number) {
    this.boundsDimensions = { width, height };
  }

}
