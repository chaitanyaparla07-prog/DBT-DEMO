{% macro function2(x)%}

Case when Month(TO_TIMESTAMP({{x}})) in (12,1,2) Then 'WINTER'
when MONTH(TO_TIMESTAMP({{x}})) in (3,4,5) then 'Spring'
when MONTH(TO_TIMESTAMP({{x}})) in (6,7,8) Then 'Summer'
Else 'Autumn'
End as Station_of_Year

{% endmacro %}