
import Foundation

struct UserDetail: Codable {
    var id: Int
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case username
        case email
        case address
        case phone
        case company
        case website
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        username = try container.decode(String.self, forKey: .username)
        email = try container.decode(String.self, forKey: .email)
        address = try container.decode(Address.self, forKey: .address)
        phone = try container.decode(String.self, forKey: .phone)
        website = try container.decode(String.self, forKey: .website)
        company = try container.decode(Company.self, forKey: .company)
    }
}

struct Company: Codable {
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case bs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
        bs = try container.decode(String.self, forKey: .bs)
    }
}

struct Address: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        street = try container.decode(String.self, forKey: .street)
        suite = try container.decode(String.self, forKey: .suite)
        city = try container.decode(String.self, forKey: .city)
        zipcode = try container.decode(String.self, forKey: .zipcode)
        geo = try container.decode(Geo.self, forKey: .geo)
    }
}

struct Geo: Codable {
    var lat: String?
    var lng: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try container.decode(String.self, forKey: .lat)
        lng = try container.decode(String.self, forKey: .lng)
    }
}
