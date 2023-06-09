module AArch64
  module Instructions
    # STZ2G -- A64
    # Store Allocation Tags, Zeroing
    # STZ2G  <Xt|SP>, [<Xn|SP>], #<simm>
    # STZ2G  <Xt|SP>, [<Xn|SP>, #<simm>]!
    # STZ2G  <Xt|SP>, [<Xn|SP>{, #<simm>}]
    class STZ2G < Instruction
      def initialize xt, xn, imm9, opt
        @xt   = check_mask(xt, 0x1f)
        @xn   = check_mask(xn, 0x1f)
        @imm9 = check_mask(imm9, 0x1ff)
        @opt  = check_mask(opt, 0x03)
      end

      def encode _
        STZ2G(@imm9, @opt, @xn, @xt)
      end

      private

      def STZ2G imm9, opt, xn, xt
        insn = 0b11011001_1_1_1_000000000_00_00000_00000
        insn |= ((imm9) << 12)
        insn |= ((opt) << 10)
        insn |= ((xn) << 5)
        insn |= (xt)
        insn
      end
    end
  end
end
