module WorkoutsHelper

    def total_time_format(time)
        time.each do |t| 
            hours = (t.minutes.to_i / 60) + t.hours
            minutes = t.seconds/60.to_i + (t.minutes % 60)
            seconds = t.seconds % 60
            return "Total time:" +  format("%02d",hours.to_s) + ":" + format("%02d",minutes.to_s) + ":" + 
            format("%02d",seconds.to_s)
        end 
    end
end
