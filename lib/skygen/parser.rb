require 'treetop'
require_relative './node_extensions'
class Parser
  Treetop.load(
     File.expand_path(
       File.join(
         File.dirname(__FILE__), 'rule_grammar_parser.treetop')))
  @@parser = RuleGrammarParser.new
  
  def self.parse(data)
    tree = @@parser.parse(data)
    if tree.nil?
      raise Exception, "Parse error at offset: #{@@parser.index}" 
    end
  
    self.clean_tree(tree)

    return tree
  end

  def self.clean_tree(root_node)
    return if root_node.elements.nil?
    root_node.elements.delete_if do |node|
      node.class.name == "Treetop::Runtime::SyntaxNode"
    end
    root_node.elements.each {|node| self.clean_tree(node)}
  end
end
puts Parser.parse('S ::= B r B 0.5').inspect

puts Parser.parse('S ::= B r B').to_array.inspect
