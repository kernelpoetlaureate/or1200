.section .text
.global _start

_start:
    // Setup a memory address (e.g., 0x1000)
    l.addi r1, r0, 0x1000     // r1 = 0x1000 (base address for memory)

    // Store a value to memory
    l.addi r2, r0, 0xAA55     // r2 = 0xAA55 (value to store)
    l.sw   0(r1), r2         // Store r2 to address r1 (Memory[0x1000] = 0xAA55)

    // Load a value from memory
    l.lwz  r3, 0(r1)         // Load from address r1 into r3 (r3 = Memory[0x1000])

    // Verify (optional, for self-checking)
    // At this point, r3 should be 0xAA55
    l.add  r4, r3, r0        // r4 = r3 (just to use r3)

loop:
    l.j     loop
    l.nop
