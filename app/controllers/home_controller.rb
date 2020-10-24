class HomeController < ApplicationController
  def dashboard

    # Ventas mensuales (12 meses)
    @sales_12_months = Sale.where(created_at: 11.months.ago..Date.today)
                        .group("strftime('%m-%Y', created_at)")
                        .order(created_at: :asc)
                        .sum(:amount)

    # Cantidad de ventas mensuales (12 meses)                    
    @quantity_12_months = Sale.where(created_at: 11.months.ago..Date.today)
                        .group("strftime('%m-%Y', created_at)")
                        .order(created_at: :asc)
                        .count

    # Promedio de venta (12 meses)
    @average_12_months = Sale.where(created_at: 11.months.ago..Date.today)
                        .group("strftime('%m-%Y', created_at)")
                        .order(created_at: :asc)
                        .average(:amount)

    # Gráficos de torta que muestren la cantidad de ventas según el origen del café
    # Los últimos 12 meses.
    @pie_chart_12_months = Sale.where(created_at: 11.months.ago..Date.today)
                        .group(:origin)
                        .limit(12)
                        .count
    # Los últimos 6 meses.
    @pie_chart_6_months = Sale.where(created_at: 5.months.ago..Date.today)
                        .group(:origin)
                        .count
    # Los últimos 3 meses.
    @pie_chart_3_months = Sale.where(created_at: 2.months.ago..Date.today)
                        .group(:origin)
                        .count
    # El último mes
    @pie_chart_last_months = Sale.where(created_at: 30.days.ago..Date.today)
                        .group(:origin)
                        .count

    # Gráficos de torta que muestren la cantidad de ventas según el nombre de la mezcla del café en:
    # Los últimos 12 meses.
    @pie_blend_name_12_months = Sale.where(created_at: 11.months.ago..Date.today)
                        .order(count: :desc)
                        .group(:blend_name)
                        .limit(12)
                        .count
    # Los últimos 6 meses.
    @pie_blend_name_6_months = Sale.where(created_at: 5.months.ago..Date.today)
                        .group(:blend_name)
                        .count
    # Los últimos 3 meses.
    @pie_blend_name_3_months = Sale.where(created_at: 2.months.ago..Date.today)
                        .group(:blend_name)
                        .count
    # El último mes
    @pie_blend_name_last_months = Sale.where(created_at: 30.days.ago..Date.today)
                        .group(:blend_name)
                        .count
  end
end
