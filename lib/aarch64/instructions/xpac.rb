module AArch64
  module Instructions
    # XPACD, XPACI, XPACLRI -- A64
    # Strip Pointer Authentication Code
    # XPACD  <Xd>
    # XPACI  <Xd>
    # XPACLRI
    class XPAC < Instruction
      def initialize rd, d
        @rd = check_mask(rd, 0x1f)
        @d  = check_mask(d, 0x01)
      end

      def encode _
        XPAC(@d, @rd)
      end

      private

      def XPAC d, rd
        insn = 0b1_1_0_11010110_00001_0_1_000_0_11111_00000
        insn |= ((d) << 10)
        insn |= (rd)
        insn
      end
    end
  end
end
