require 'treetop'
require 'pry'
require_relative './node_extensions'
class Parser
  Treetop.load(
     File.expand_path(
       File.join(
         File.dirname(__FILE__), 'rule_grammar_parser.treetop')))
  @@parser = RuleGrammarParser.new
  
  def self.parse(data)
    # binding.pry
    tree = @@parser.parse(data)
    if tree.nil?
      raise Exception, "Parse error at offset: #{@@parser.index}" 
    end
    # binding.pry 
     self.clean_tree(tree)

    return tree
  end

  def self.clean_tree(root_node)
    return if root_node.elements.nil?
    root_node.elements.delete_if do |node|
      node.class.name == "Treetop::Runtime::SyntaxNode" and
      node.elements.nil?
    end
    root_node.elements.each {|node| self.clean_tree(node)}
  end
end

f = File.read('./grammar.gr')
puts Parser.parse(f).inspect
# binding.pry

# puts Parser.parse(f).to_array.inspect
