class Record
  attr_accessor :id, :sent, :approved, :closed, :initial_amount

  def self.find(id)
    sleep 2
    new({ id: id, sent: "yes", approved: "yes", closed: "yes", initial_amount: 80 })
  end

  def initialize(args)
    @id = args.fetch(:id) { 1 }
    @sent = args.fetch(:sent) { "no" }
    @approved = args.fetch(:approved) { "no" }
    @closed = args.fetch(:closed) { "no" }
    @initial_amount = args.fetch(:initial_amount) { 20 }
  end

  def sent?
    sent == "yes"
  end

  def approved?
    approved == "yes"
  end

  def closed?
    closed == "yes"
  end

  def amount
    initial_amount * 1.25
  end
end

class Sender
  def self.send(record)
    record.sent = "yes"
    ImportantExternalClient.external_send(record)
  end

  class ImportantExternalClient
    def self.external_send(record)
      # pretend this does something
    end
  end
end

class Logger
  @messages = []

  def self.log(action, record)
    @messages << { action: action, record_id: record.id, amount: record.amount }
  end

  def self.history
    @messages
  end

  def self.clear
    @messages = []
  end
end

class Approver
  THRESHOLD = 50

  def self.approve(record)
    if record.amount >= THRESHOLD
      record.approved = "yes"
    else
      record.sent = "no"
    end
  end
end

class Closer
  def self.close(record)
    record.closed = "yes"
    # some expensive operation
  end
end

class Interactor
  def self.call(id:)
    record = Record.find(id)
    return record if record.closed?

    if !record.sent?
      Sender.send(record)
      Logger.log("sent", record)
    elsif !record.approved?
      Approver.approve(record)
      Logger.log("approve", record)
    else
      Closer.close(record)
      Logger.log("close", record)
    end

    record
  end
end
