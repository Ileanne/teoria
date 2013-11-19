class Grammar
  def initialize(nt_symbols, t_symbols, rules, start_symbol)
    @nt_s = nt_symbols
    @t_s = t_symbols
    @rules = rules
    @s_s = start_symbol
  end
end
