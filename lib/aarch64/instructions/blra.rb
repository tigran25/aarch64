module AArch64
  module Instructions
    # BLRAA, BLRAAZ, BLRAB, BLRABZ -- A64
    # Branch with Link to Register, with pointer authentication
    # BLRAAZ  <Xn>
    # BLRAA  <Xn>, <Xm|SP>
    # BLRABZ  <Xn>
    # BLRAB  <Xn>, <Xm|SP>
    class BLRA < Instruction
      def initialize rn, rm, z, m
        @rn = check_mask(rn, 0x1f)
        @rm = check_mask(rm, 0x1f)
        @z  = check_mask(z, 0x01)
        @m  = check_mask(m, 0x01)
      end

      def encode _
        BLRA(@z, @m, @rn, @rm)
      end

      private

      def BLRA z, m, rn, rm
        insn = 0b1101011_0_0_01_11111_0000_1_0_00000_00000
        insn |= ((z) << 24)
        insn |= ((m) << 10)
        insn |= ((rn) << 5)
        insn |= (rm)
        insn
      end
    end
  end
end
