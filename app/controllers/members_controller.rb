class MembersController < ApplicationController
    def index
        @members = Member.order("number")
    end

    def show
        @member = Member.find(params[:id])
    end

    def new
        @member = Member.new
    end

    def edit
        @member = Member.find(params[:id])
    end

    # 新規登録
    def create
        @member = Member.new(params[:member])

        if @member.save
            redirect_to @member, notice: "ユーザを登録しました。"
        else
            render "new"
        end

    end

    # 更新
    def update
        @member = Member.find(params[:id])
        @member.assign_attributes(params[:member])

        if @member.save
            redirect_to @member, notice: "ユーザを更新しました。"
        else
            render "edit"
        end
    end

    # 削除
    def destroy
        @member = Member.find(params[:id])
        @member.destroy

        redirect_to :members, notice: "ユーザを削除しました。"
    end

    # 検索機能
    def search
        @members = Member.search(params[:q])
        render "index"
    end
end
