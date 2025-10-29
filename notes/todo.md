systems_knowledge_base.txt

1. Fundamentals of Operating Systems
-------------------------------------
Processes & Threads – Fork, exec, context switching, scheduling.
Memory management – Heap/stack, paging, segmentation, virtual memory.
File system – Inodes, block storage, ext4/NTFS, virtual file systems.
Syscalls – How user programs talk to the OS kernel.
Interrupts & I/O – How devices communicate with CPU (e.g., keyboard, mouse).
OS Event Handling – Event-driven architectures in OS, epoll/kqueue.
Terminals – PTY, TTY, ANSI escape codes, input/output buffering.

2. Concurrency & Parallelism
-----------------------------
Concurrency – Cooperative multitasking, threads, async/await.
Parallelism – Multicore execution, SIMD, parallel algorithms.
Coroutines & Event Loops – async/await, libuv, cooperative multitasking.

3. Programming Language Internals
----------------------------------
Compilers & Interpreters – Lexing, parsing, IR, bytecode generation.
Linkers & Loaders – ELF, static/dynamic linking, symbol resolution.
Object models – vtables in C++, prototype chain in JavaScript.
Garbage collection – Reference counting, mark-and-sweep.
JIT & AOT – Just-In-Time vs Ahead-Of-Time compilation (e.g., Java, V8).

4. Language Tools and Code Intelligence
----------------------------------------
Tree-sitter – Incremental parsing, syntax trees.
Language Server – LSP, JSON-RPC, code intelligence.

5. Programming Languages & Scripting
-------------------------------------
Lua – Lightweight scripting, Neovim plugins, embedding in C apps.
Rust – Systems programming, ownership model, memory safety.
DSA – Data structures & algorithms for low-level efficiency.

6. Development Tools & Workflow
--------------------------------
Makefiles & Build Systems – make, ninja, cmake, how code gets compiled.
Version Control Internals – How Git stores objects, commits, branches.
Containers – Namespaces, cgroups, Docker internals.
Virtualization – QEMU, KVM, hypervisors, hardware virtualization.
Syscall tracing – strace, dtrace, kernel tracing.

7. System Optimization & Security
----------------------------------
Memory safety – Buffer overflows, ASLR, stack canaries.
CPU caches – L1/L2/L3 cache, cache misses, prefetching.
Branch prediction & pipelining – How modern CPUs optimize execution.
Secure boot & TPM – Cryptographic guarantees during boot.

8. Patterns & Utilities
------------------------
Polling – How pooling (e.g., connection or memory pooling) works.
Event handling – Poll/select, epoll, reactive systems, observer patterns.

