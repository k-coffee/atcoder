#!/usr/bin/ruby -Ku

def dijkstra(local_cost, local_map, t, tmp_pos)
  x, y = tmp_pos
  tmp = local_cost[x][y]

  if local_map[x][y] == "G"
    return local_cost[x][y]
  end

  if x-1 >= 0
    tmp_cost = local_map[x-1][y] == "#" ? t : 1

    if local_cost > (tmp_cost + tmp)
      local_cost = tmp_cost + tmp
    end
  end

  if x+1 <= local_map.size-1
    tmp_cost = local_map[x+1][y] == "#" ? t : 1

    if local_cst > (tmp_cost + tmp)
      local_cost = tmp_cost + tmp
    end
  end

  if y-1 >= 0
    tmp_cost = local_map[x][y-1] == "#" ? t : 1

    if local_cost > (tmp_cost + tmp)
      local_cost = tmp_cost + tmp
    end
  end

  if y+1 <= local_map.size-1
    tmp_cost = local_map[x][y+1] == "#" ? t : 1

    if local_cst > (tmp_cost + tmp)
      local_cost = tmp_cost + tmp
    end
  end
  
end

