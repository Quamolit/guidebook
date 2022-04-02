
# `comp-slider`

```cirru
comp-slider (>> states :v)
  {}
    :value $ :v state
    :unit 0.2
    :on-change $ fn (v d!)
      d! cursor $ assoc state :v v
    :position $ [] 100 40
    :min -4
    :max 40
    :title "\"long long title"
```
