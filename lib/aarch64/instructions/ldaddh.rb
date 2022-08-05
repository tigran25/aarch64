module AArch64
  module Instructions
    # LDADDH, LDADDAH, LDADDALH, LDADDLH -- A64
    # Atomic add on halfword in memory
    # LDADDAH  <Ws>, <Wt>, [<Xn|SP>]
    # LDADDALH  <Ws>, <Wt>, [<Xn|SP>]
    # LDADDH  <Ws>, <Wt>, [<Xn|SP>]
    # LDADDLH  <Ws>, <Wt>, [<Xn|SP>]
    class LDADDH < Instruction
      def initialize rs, rt, rn, a, r
        @rs = check_mask(rs, 0x1f)
        @rt = check_mask(rt, 0x1f)
        @rn = check_mask(rn, 0x1f)
        @a  = check_mask(a, 0x01)
        @r  = check_mask(r, 0x01)
      end

      def encode
        LDADDH(@a, @r, @rs, @rn, @rt)
      end

      private

      def LDADDH a, r, rs, rn, rt
        insn = 0b01_111_0_00_0_0_1_00000_0_000_00_00000_00000
        insn |= ((apply_mask(a, 0x1)) << 23)
        insn |= ((apply_mask(r, 0x1)) << 22)
        insn |= ((apply_mask(rs, 0x1f)) << 16)
        insn |= ((apply_mask(rn, 0x1f)) << 5)
        insn |= (apply_mask(rt, 0x1f))
        insn
      end
    end
  end
end
