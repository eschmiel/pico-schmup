function colliding(box1,box2)
    return (  
        box1[1] <= box2[3] and
        box1[2] <= box2[4] and
        box1[3] >= box2[1] and
        box1[4] >= box2[2]
    )
end

--point in collision box
function point_in_col_box(x,y,box)
    return (  
        x >= box[1] and
        y >= box[2] and
        x <= box[3] and
        y <= box[4] 
    )
end