module RuleGrammar

  class InferenceRule < Treetop::Runtime::SyntaxNode
    def to_array
      return self.elements.map(&:to_array)
    end
  end

  class Body < Treetop::Runtime::SyntaxNode
    def to_array
      return self.elements.map(&:to_array)
    end
  end
  
  class TSymbol < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value
    end
  end

  class NTSymbol < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value.to_sym
    end
  end

end
