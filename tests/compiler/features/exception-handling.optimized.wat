(module
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$v (func))
 (memory $0 1)
 (data (i32.const 8) "\n\00\00\00\01\00\00\00\01\00\00\00\n\00\00\00E\00r\00r\00o\00r")
 (data (i32.const 44) "\01\00\00\00\01")
 (data (i32.const 56) "\04\00\00\00\01\00\00\00\01\00\00\00\04\00\00\00h\00i")
 (global $~lib/rt/stub/startOffset (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/started (mut i32) (i32.const 0))
 (event $exception (attr 0) (param i32))
 (export "__start" (func $start))
 (export "memory" (memory $0))
 (export "test2" (func $features/exception-handling/test2))
 (func $~lib/rt/stub/maybeGrowMemory (; 0 ;) (type $FUNCSIG$vi) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  memory.size
  local.tee $2
  i32.const 16
  i32.shl
  local.tee $1
  i32.gt_u
  if
   local.get $2
   local.get $0
   local.get $1
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $1
   local.get $2
   local.get $1
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $1
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $0
  global.set $~lib/rt/stub/offset
 )
 (func $~lib/rt/stub/__alloc (; 1 ;) (type $FUNCSIG$i) (result i32)
  (local $0 i32)
  (local $1 i32)
  global.get $~lib/rt/stub/offset
  i32.const 16
  i32.add
  local.tee $1
  i32.const 16
  i32.add
  call $~lib/rt/stub/maybeGrowMemory
  local.get $1
  i32.const 16
  i32.sub
  local.tee $0
  i32.const 16
  i32.store
  local.get $0
  i32.const -1
  i32.store offset=4
  local.get $0
  i32.const 3
  i32.store offset=8
  local.get $0
  i32.const 12
  i32.store offset=12
  local.get $1
 )
 (func $features/exception-handling/test2 (; 2 ;) (type $FUNCSIG$i) (result i32)
  (local $0 i32)
  call $~lib/rt/stub/__alloc
  local.tee $0
  i32.const 24
  i32.store
  local.get $0
  i32.const 56
  i32.store offset=4
  local.get $0
  i32.const 72
  i32.store offset=8
  local.get $0
  throw $exception
 )
 (func $start (; 3 ;) (type $FUNCSIG$v)
  global.get $~lib/started
  if
   return
  else
   i32.const 1
   global.set $~lib/started
  end
  i32.const 80
  global.set $~lib/rt/stub/startOffset
  i32.const 80
  global.set $~lib/rt/stub/offset
 )
 (func $null (; 4 ;) (type $FUNCSIG$v)
  nop
 )
)