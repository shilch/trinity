package api

type Grid struct {
	Id int64 `json:"id,omitempty"`

	Name string `json:"name,omitempty"`

	Power int64 `json:"power,omitempty"`

	Online bool `json:"online,omitempty"`
}
