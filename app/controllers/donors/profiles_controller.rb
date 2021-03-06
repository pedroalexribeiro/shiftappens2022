# frozen_string_literal: true

module Donors
  class ProfilesController < DonorBaseController
    before_action :set_donor, only: %i[show edit update destroy]

    # GET /donors/1 or /donors/1.json
    def show
      @events = Organization.all.map(&:events).flatten.sort_by(&:created_at)
    end

    # GET /donors/1/edit
    def edit; end

    # PATCH/PUT /donors/1 or /donors/1.json
    def update
      result = if params[:donor][:password].blank? && params[:donor][:password_confirmation].blank?
                 @donor.update_without_password(donor_params)
               else
                 @donor.update(donor_params)
               end
      respond_to do |format|
        if result
          format.html { redirect_to donors_profile_url(@donor), notice: 'Donor was successfully updated.' }
          format.json { render :show, status: :ok, location: @donor }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @donor.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /donors/1 or /donors/1.json
    def destroy
      @donor.destroy

      respond_to do |format|
        format.html { redirect_to donors_url, notice: 'Donor was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donor_params
      params.require(:donor).permit(:name, :type, :email, :password, :password_confirmation, :bio)
    end
  end
end
