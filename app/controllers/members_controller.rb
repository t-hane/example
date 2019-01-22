class MembersController < ApplicationController

    def index
        @members = Member.all
    end

    def new
        @member = Member.new
    end

    def create
        Member.transaction do
            member_params = params.require(:member)
                .permit(:name, :age, :email)

            @member = Member.new member_params
            @member.save!
        end

    rescue ActiveRecord::RecordInvalid 
        render action: :new
    end

    def show
        @member = Member.find params[:id]
    end

    def edit
        @member = Member.find params[:id]
    end

    def update
        Member.transaction do
            member_params = params.require(:member)
                .permit(:name, :age, :email)

            @member = Member.find params[:id]
            @member.update_attributes! member_params
        end

    rescue ActiveRecord::RecordInvalid 
        render action: :edit
    end
end
