module RuleGrammar

  class FormalGrammar < Treetop::Runtime::SyntaxNode
    def to_array
      output = []
      self.elements.each do |e|
        if e.respond_to? :to_array
          output << e.to_array
        end
      end
      return output
    end
  end

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
 
  class GrammarIdentifier < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value.to_sym
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

  class Probability < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value.to_f
    end
  end

end
