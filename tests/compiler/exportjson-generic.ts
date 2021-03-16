class Test<T> {

}

@exportjson
export function test<T>(foo: Test<T>): Test<T> {
  return foo;
}

export class Foo {
  @exportjson
  bar(): Test<string> {
    return new Test<string>();
  }
}

export class Bar<T> {
  @exportjson
  foo(): void {}

  @exportjson
  bar(a: T): T {
    return a;
  }

  @exportjson
  complex<V>(v: V): V {
    return v;
  }
}

class A {}
class B extends A {}

export function check(): void {
  test(new Test<i32>());
  new Bar<string>().bar("Hello!");
  new Bar<A>().complex<B>(new B());
}
