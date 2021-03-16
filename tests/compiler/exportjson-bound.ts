class MyFoo {
  a: number;

  @exportjson
  constructor(a: number) {
    this.a = a;
  }

  @exportjson
  static g(v:number, c: number): number {
    return v + c;
  }
}