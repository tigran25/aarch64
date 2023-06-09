module AArch64
  module Instructions
    # BRAA, BRAAZ, BRAB, BRABZ -- A64
    # Branch to Register, with pointer authentication
    # BRAAZ  <Xn>
    # BRAA  <Xn>, <Xm|SP>
    # BRABZ  <Xn>
    # BRAB  <Xn>, <Xm|SP>
    class BRA < Instruction
      def initialize rn, rm, z, m
        @rn = check_mask(rn, 0x1f)
        @rm = check_mask(rm, 0x1f)
        @z  = check_mask(z, 0x01)
        @m  = check_mask(m, 0x01)
      end

      def encode _
        BRA(@z, @m, @rn, @rm)
      end

      private

      def BRA z, m, rn, rm
        insn = 0b1101011_0_0_00_11111_0000_1_0_00000_00000
        insn |= ((z) << 24)
        insn |= ((m) << 10)
        insn |= ((rn) << 5)
        insn |= (rm)
        insn
      end
    end
  end
end
