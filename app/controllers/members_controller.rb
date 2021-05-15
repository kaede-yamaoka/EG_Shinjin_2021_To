class MembersController < ApplicationController
    def index #一覧画面出力
        @members = Member.order("number")#numberの降順に並び変える
    end

    def show #ユーザーの詳細画面
       @member = Member.find(params[:id])

    end

    def new
       @member = Member.new(birthday: Date.new(1900,5,4))
    end

    def edit
       @member = Member.find(params[:id])
    end

    # 新規登録
    def create
        @member = Member.new(params[:member])
        if @member.save
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
            redirect_to @member
        else
            render 'edit'
        end
    end
    # 削除
    def destroy
        @member = Member.find(params[:id])
        @member.destroy
        redirect_to @member
    end

    # 検索機能
    def search 
        @members = Member.search(params[:q])
        render 'index'
    end
end
