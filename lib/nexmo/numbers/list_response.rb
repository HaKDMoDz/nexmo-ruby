class Nexmo::Numbers::ListResponse < Nexmo::Response
  include Enumerable

  def each
    return enum_for(:each) unless block_given?

    @entity.numbers.each { |item| yield item }
  end
end
