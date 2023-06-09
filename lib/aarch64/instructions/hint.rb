module AArch64
  module Instructions
    # HINT -- A64
    # Hint instruction
    # HINT  #<imm>
    class HINT < Instruction
      def initialize crm, op2
        @crm = check_mask(crm, 0x0f)
        @op2 = check_mask(op2, 0x07)
      end

      def encode _
        HINT(@crm, @op2)
      end

      private

      def HINT crm, op2
        insn = 0b1101010100_0_00_011_0010_0000_000_11111
        insn |= ((crm) << 8)
        insn |= ((op2) << 5)
        insn
      end
    end
  end
end
