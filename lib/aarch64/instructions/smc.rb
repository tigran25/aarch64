module AArch64
  module Instructions
    # SMC -- A64
    # Secure Monitor Call
    # SMC  #<imm>
    class SMC < Instruction
      def initialize imm16
        @imm16 = check_mask(imm16, 0xffff)
      end

      def encode _
        SMC(@imm16)
      end

      private

      def SMC imm16
        insn = 0b11010100_000_0000000000000000_000_11
        insn |= ((imm16) << 5)
        insn
      end
    end
  end
end
