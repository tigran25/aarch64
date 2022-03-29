module AArch64
  module Utils
    EncodedMask = Struct.new(:n, :immr, :imms)

    MAX_INT_64 = 0xFFFFFFFFFFFFFFFF

    COND_TABLE = {
      "EQ"  => 0b0000,
      "NE"  => 0b0001,
      "CS"  => 0b0010,
      "CC"  => 0b0011,
      "MI"  => 0b0100,
      "PL"  => 0b0101,
      "VS"  => 0b0110,
      "VC"  => 0b0111,
      "HI"  => 0b1000,
      "LS"  => 0b1001,
      "GE"  => 0b1010,
      "LT"  => 0b1011,
      "GT"  => 0b1100,
      "LE"  => 0b1101,
      "AL"  => 0b1110,
      "NVb" => 0b1111,
    }

    def cond2bin cond
      COND_TABLE.fetch(cond.to_s.upcase)
    end
    module_function :cond2bin

    def mask? num
      ((num + 1) & num) == 0
    end
    module_function :mask?

    def shifted_mask? num
      mask?((num - 1) | num)
    end
    module_function :shifted_mask?

    def count_trailing_zeros num
      count = 0
      loop do
        break if num & 1 == 1
        count += 1
        num >>= 1
      end

      count
    end
    module_function :count_trailing_zeros

    def count_trailing_ones num
      count = 0
      loop do
        break if num & 1 == 0
        count += 1
        num >>= 1
      end

      count
    end
    module_function :count_trailing_ones

    def count_leading_ones num
      count = 0
      top_bit = 1 << 63
      loop do
        break if num & top_bit != top_bit
        count += 1
        (num <<= 1) & MAX_INT_64
      end
      count
    end
    module_function :count_leading_ones

    def encode_mask imm
      size = 64
      loop do
        size >>= 1
        mask = (1 << size) - 1
        if (imm & mask) != ((imm >> size) & mask)
          size <<= 1
          break
        end

        break unless size > 2
      end

      mask = (-1 & MAX_INT_64) >> (64 - size)
      imm &= mask

      if shifted_mask?(imm)
        i = count_trailing_zeros imm
        cto = count_trailing_ones(imm >> i)
      else
        imm |= ((~mask) & MAX_INT_64)
        unless shifted_mask?((~imm) & MAX_INT_64)
          return nil
        end

        clo = count_leading_ones(imm & MAX_INT_64)
        i = 64 - clo
        cto = clo + count_trailing_ones(imm) - (64 - size)
      end

      immr = (size - i) & (size - 1)
      imms = (~(size - 1) << 1) | (cto - 1)
      n    = ((imms >> 6) & 1) ^ 1

      EncodedMask.new(n, immr, imms & 0x3F)
    end

    module_function :encode_mask
  end
end