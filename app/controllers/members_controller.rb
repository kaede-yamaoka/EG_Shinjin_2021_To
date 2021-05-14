class MembersController < ApplicationController
    def index
        @members = Member.order("number")
    end

    def show
    end

    def new
    end

    def edit
    end

    # 新規登録
    def create
    end

    # 更新
    def update
    end

    # 削除
    def destroy
    end

    # 検索機能
    def search
    end
end
