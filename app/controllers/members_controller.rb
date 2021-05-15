class MembersController < ApplicationController
    def index
        @members = Member.order("number")
    end

    def show
        @member = Member.find(params[:id])
    end

    def new
        @member = Member.new(birthday: Date.new(1980,1,1))
    end

    def edit
        @member = Member.find(params[:id])
    end

    # 新規登録docker
    def create
        @member = Member.new(params[:member])
        if @member.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @member
        else
        render 'new'
        end
    end

    # 更新
    def update
        @member = Member.find(params[:id]) 
        @member.assign_attributes(params[:member])
        if @member.save
            # 更新に成功したときの処理
            redirect_to @member, notice: "ユーザ情報を更新しました。"
        else
            render 'edit'
          end
    end

    # 削除
    def destroy
        Member.find(params[:id]).destroy
        redirect_to action: :index
    flash[:success] = "Member deleted"
    end

    # 検索機能
    def search
        @members = Member.search(params[:q])
        render 'index'
    end
end

