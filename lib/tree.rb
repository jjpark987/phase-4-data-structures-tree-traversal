require 'pry'

class Tree
  def initialize(root = nil)
    @root = root
  end

  # depth-first search
  def get_element_by_id string
    # depth_first_traversal(@root).each do |node|
    #   return node if node[:id] == string
    # end
    breadth_first_traversal(@root).each do |node|
      return node if node[:id] == string
    end
    nil
  end

  def depth_first_traversal node
    result = []
    nodes_to_visit = [node]

    while nodes_to_visit.length > 0
      node = nodes_to_visit.shift
      result.push(node)
      # add child nodes to the beginning of nodes_to_visit
      nodes_to_visit = node[:children] + nodes_to_visit
    end

    result
  end

  def breadth_first_traversal node
    result = []
    nodes_to_visit = [node]
  
    while nodes_to_visit.length > 0
      node = nodes_to_visit.shift
      result.push(node) 
      # add child nodes to the end of nodes_to_visit
      nodes_to_visit = nodes_to_visit + node[:children]
    end
  
    result
  end
end