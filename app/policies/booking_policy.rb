class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !user.nil?
  end

  def show?
    user == record.user
  end

  def accept?
    true
  end

  
  def decline?
    true
  end
end
