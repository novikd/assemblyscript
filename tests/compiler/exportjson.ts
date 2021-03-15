@exportjson
function f() : i32 {
  return 1;
}

@exportjson
export function g() : i32 {
  return 1;
}

class Len {
  length : i32
}

class MyLen extends Len {}

@exportjson
function len<T extends Len>(a: T): number {
  return a.length;
}

@exportjson
function test<T>(a: T): T {
  return a;
}

type Len2 = Len;

@exportjson
export function check(a : Len2): void {
  len(new MyLen());
  len(new Len());
  len([1, 2, 3]);
  test(1);
  test("123");
  test(new Len());
  test(a);
}
