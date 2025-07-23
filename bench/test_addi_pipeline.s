.section .text
.global _start

_start:
    # Demonstrate ADDI (Load immediate using R0 as zero)
    l.addi r1, r0, 0x1       # r1 = 1
    l.addi r2, r0, 0x2       # r2 = 2
    l.addi r3, r0, 0x3       # r3 = 3
    l.addi r4, r0, 0x4       # r4 = 4

    # Simple ADD (register-to-register)
    l.add  r5, r1, r2        # r5 = r1 + r2 (1 + 2 = 3)

    # Demonstrate MOVHI and ORI (Move immediate into a register)
    l.movhi r6, 0x1234       # Load upper 16 bits of r6 with 0x1234
    l.ori   r6, r6, 0x5678   # OR lower 16 bits of r6 with 0x5678 (r6 = 0x12345678)

    # Infinite loop to stop execution
loop:
    l.j     loop             # Jump to self
    l.nop                    # NOP for branch delay slot (common in RISC)
